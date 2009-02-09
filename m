Received: from mail-ew0-f20.google.com ([209.85.219.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWVzb-0001B4-FD
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 13:16:10 +0000
Received: by ewy13 with SMTP id 13so2751996ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Feb 2009 05:16:05 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: Adam Yergovich <ayergo@jkmicro.com>
Subject: Re: Access entire device with mtdblock0
References: <4967F2B2.4060405@jkmicro.com>
	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
	<878wpeclf1.fsf@macbook.be.48ers.dk>
	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
	<20090114115056.GD7994@leila.ping.de> <49839668.20502@jkmicro.com>
	<BD79186B4FD85F4B8E60E381CAEE19090120BA94@mi8nycmail19.Mi8.com>
	<498B852E.6010809@jkmicro.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 09 Feb 2009 14:15:37 +0100
In-Reply-To: <498B852E.6010809@jkmicro.com> (Adam Yergovich's message of "Thu\,
	05 Feb 2009 16\:32\:46 -0800")
Message-ID: <87tz737nuu.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Wolfgang Wegner <wolfgang@leila.ping.de>,
	hartleys <hartleys@visionengravers.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Adam" == Adam Yergovich <ayergo@jkmicro.com> writes:

Hi,

 Adam> If that assumption is correct, I think it should be changed to either:

 Adam> 1) Call it before partitioning so it does add the device.

 Adam> -or-

 Adam> 2) Change the function such that it works any time and thus the physmap 
 Adam> call should work as originally written.

It would be bad to change this now to do it automatically as it would
screw up the mtd numbering.

Why not just create an extra partition with the entire size if you
need it?

-- 
Bye, Peter Korsgaard
