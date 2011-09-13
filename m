Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R3bUJ-0000yZ-7L
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2011 22:29:55 +0000
Received: by wwp14 with SMTP id 14so894765wwp.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2011 15:29:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1315744119.18731.38.camel@sauron>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-5-git-send-email-computersforpeace@gmail.com>
	<1315742234.18731.32.camel@sauron>
	<1315744119.18731.38.camel@sauron>
Date: Tue, 13 Sep 2011 18:29:50 -0400
Message-ID: <CAN8TOE8e_ahVOWPgesbSaWzj+V1UYS3NPoyttRYExKi0vskMVw@mail.gmail.com>
Subject: Re: [PATCH 04/12] mtd: move mtd_oob_mode_t to shared kernel/user space
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: b35362@freescale.com, Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 11, 2011 at 8:28 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2011-09-11 at 14:57 +0300, Artem Bityutskiy wrote:
>> It is good to use __u8 in ioctls for this field.
>>
>> But for internal usage there is no need to make it uint8_t, just use
>> 'int' instead. All modern CPUs will anyway reserve 32 bits for this.
>>
>> And unnecessary usage of the 8-bits restriction only imposes more
>> unnecessary limitations to the compiler/CPU. Using 'int' is instead
>> making CPU/compiler use the native integer type.

Thanks, good suggestion. I think I considered this issue but not very
thoroughly. My only reason for uint8_t here was just to prevent the
temptation to use all 32 bits of the field. But there's no way we'd
use 32 bits for a enumerated mode, i.e., we'd need to have more than
256 modes to run into this issue... I think we'd be having other more
important issues if we get there :)

> I've actually amended your patch and used 'unsigned int mode' instead,
> and pushed to my three. Please, complain and send new versions if you do
> not like that.

No complaint.

Brian
