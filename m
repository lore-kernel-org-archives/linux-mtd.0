Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN3dD-00027K-Lu
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 11:09:58 +0000
Received: by ey-out-1920.google.com with SMTP id 4so52580eyg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jan 2009 03:09:54 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: Access entire device with mtdblock0
References: <4967F2B2.4060405@jkmicro.com>
	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
	<878wpeclf1.fsf@macbook.be.48ers.dk>
	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Jan 2009 12:09:51 +0100
In-Reply-To: <8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
	(Mike Frysinger's message of "Wed\, 14 Jan 2009 05\:58\:43 -0500")
Message-ID: <874p02cfeo.fsf@macbook.be.48ers.dk>
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

 >> Why not just add a partition spanning the entire device in
 >> addition to the other partitions?

 Mike> i was not aware partition tables allowed for overlaps.  if
 Mike> that's true, then the answer is obvious and easy to implement
 Mike> in boards ...

I'm pretty sure it does, and I don't see any checks for it in
mtdpart.c:add_one_partition()

-- 
Bye, Peter Korsgaard
