Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAK0s-0001Cn-CW
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2014 13:56:38 +0000
Message-ID: <52EF9FFE.4020405@nod.at>
Date: Mon, 03 Feb 2014 14:56:14 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.02.2014 13:51, schrieb Wiedemer, Thorsten (Lawo AG):
> Hi,
> 
> I can reproduce it fairly regularly, but not really "quickly". At the moment, I can use a setup of about identical 70 devices.
> A test over the last weekend resultet In 6 devices showing the bug.
> What we have are multiple processes which write in different intervals some data on the device and sync it, because this data should be available after a power cut.
> Perhaps I can force the error more often in writing test processes with shorter write/sync intervals.
> 
> If I have further access to the "big" setup for some days, I will try to make a test without preemption.

Hmm, ok.
Please also apply this patch, just in case...

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0e11671d..48fd2aa 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -301,6 +301,7 @@ static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum)

 	spin_lock(&ubi->ltree_lock);
 	le = ltree_lookup(ubi, vol_id, lnum);
+	ubi_assert(le);
 	le->users -= 1;
 	ubi_assert(le->users >= 0);
 	up_write(&le->mutex);

Thanks,
//richard
