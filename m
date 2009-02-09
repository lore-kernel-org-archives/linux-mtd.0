Subject: Re: Regarding UBI scalability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240902080231r51c4bcf3o37c0044bf9d924ee@mail.gmail.com>
References: <7824366.270131233573513030.JavaMail.weblogic@epml10>
	<49896448.20407@nokia.com>
	<6b5362aa0902050140q3c6cbe85ye03d9b5ee59c7f48@mail.gmail.com>
	<71cd59b00902080148l5304b4eie4dd3868ec12337e@mail.gmail.com>
	<9c9fda240902080231r51c4bcf3o37c0044bf9d924ee@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Feb 2009 10:46:22 +0200
Message-Id: <1234169182.17790.92.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: AMIT KUMARSHARMA <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	Brijesh Singh <brij.singh@samsung.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-02-08 at 19:31 +0900, Kyungmin Park wrote:
> One more requested feature.
> How about to scan ubi image and bad block table at simultaneously?
> Now there's two full device scan, bbt and ubi at booting time.
> As internal LEA mapping layout, how about to add bbt layout?
> 
> It's also helpful to MLC since MLC doesn't have read oob so it calls
> page read command to build bbt.
> As you know it takes long time.
> 
> I'm not sure if internal LEA maping is supported, it's meaningful work or not.
> 
> How do you think?

Well, doing scanning twice is not very good indeed. I guess what you
could do is to make MTD avoid scanning and building the bad block
table at all and build it lazily. But then you need 2 bits per
eraseblock, not just one. IOW, sure, it is possible to optimize this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
