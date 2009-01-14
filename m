Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN1bb-0003ka-78
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 09:00:10 +0000
Received: by ewy6 with SMTP id 6so463574ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jan 2009 01:00:05 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: Access entire device with mtdblock0
References: <4967F2B2.4060405@jkmicro.com>
	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Jan 2009 10:00:02 +0100
In-Reply-To: <8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
	(Mike Frysinger's message of "Tue\, 13 Jan 2009 18\:10\:22 -0500")
Message-ID: <878wpeclf1.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, Adam Yergovich <ayergo@jkmicro.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Mike" == Mike Frysinger <vapier.adi@gmail.com> writes:

Hi,

 >> Any recommendations on a simple way to create a partition using the
 >> entirety of flash?

 Mike> looks like no one responded.  i'm pretty sure the answer is to use
 Mike> add_mtd_device() even in face of add_mtd_partitions().

Why not just add a partition spanning the entire device in addition to
the other partitions?

-- 
Bye, Peter Korsgaard
