From: manningc2@actrix.gen.nz (Charles Manning)
Date: Tue, 18 Feb 2003 11:30:50 +1300
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <3E51079B.8090002@netscape.net>
References: <4EF56021.2C81712E.0265FBE9@netscape.net> <200302171637.42445.tglx@linutronix.de> <3E51079B.8090002@netscape.net>
Message-ID: <20030217223604.A073A481C@tiger.actrix.co.nz>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 18 Feb 2003 05:02, kokseng choo wrote:
> tglx at linutronix.de wrote:
> >On Monday 17 February 2003 13:36, kokseng choo wrote:
> >
> >
> >Yep, but you still do not write fs-specific information in the OOB-area,
> >except the ecc.
> >This still solves not the problem to write a fs-image to the chip.

For YAFFS you should use

mkyaffs dev_name image_name

This formats and writes the image in one step. I do not suggest you use cp or 
erase.

-- CHarles
