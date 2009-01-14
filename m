Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN3SO-0007cD-Is
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 10:58:47 +0000
Received: by wf-out-1314.google.com with SMTP id 28so479483wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jan 2009 02:58:43 -0800 (PST)
Message-ID: <8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
Date: Wed, 14 Jan 2009 05:58:43 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Peter Korsgaard" <jacmet@sunsite.dk>
Subject: Re: Access entire device with mtdblock0
In-Reply-To: <878wpeclf1.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4967F2B2.4060405@jkmicro.com>
	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
	<878wpeclf1.fsf@macbook.be.48ers.dk>
Cc: linux-mtd@lists.infradead.org, Adam Yergovich <ayergo@jkmicro.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2009 at 04:00, Peter Korsgaard wrote:
> "Mike" == Mike Frysinger <writes:
>>> Any recommendations on a simple way to create a partition using the
>>> entirety of flash?
>>
>> looks like no one responded.  i'm pretty sure the answer is to use
>> add_mtd_device() even in face of add_mtd_partitions().
>
> Why not just add a partition spanning the entire device in addition to
> the other partitions?

i was not aware partition tables allowed for overlaps.  if that's
true, then the answer is obvious and easy to implement in boards ...
-mike
