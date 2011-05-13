Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKrdT-0002NK-V4
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 12:38:28 +0000
Received: by eyh6 with SMTP id 6so819585eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 05:38:26 -0700 (PDT)
Subject: RE: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
In-Reply-To: <1305289765.14423.20.camel@localhost>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
	<1305198589.2713.97.camel@localhost>
	<1305273513.14423.15.camel@localhost>
	<0A40042D85E7C84DB443060EC44B3FD32A694157DD@dekaexchange07.deka.local>
	<1305289765.14423.20.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 May 2011 15:34:50 +0300
Message-ID: <1305290090.14423.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-13 at 15:29 +0300, Artem Bityutskiy wrote:
> Well, UBIFS is part of the kernel and it follows the kernel coding
> style.

Note, in this case I'm talking only about tabs as indentation, like

<tab>if (a)
<tab><tab>if (b)
<tab><tab><tab>function();

The other thing is tabs as "dynamic spaces", like:

int a<tab>=0;
int aa<tab>=0;

Some people use tabs as "dynamic spaces" because many editors will align
things. I personally do not appreciate this at all, and the kernel
Coding style does not require this. I only use tabs for indentation at
the beginning of the line.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
