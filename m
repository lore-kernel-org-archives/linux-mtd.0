Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17RsIu-0006ac-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2002 11:33:08 +0100
Received: from Altera.COM (sunrise [137.57.1.1])
	by darwin.altera.com (8.10.2+Sun/8.10.2) with ESMTP id g69AUYW27736
	for <linux-mtd@lists.infradead.org>; Tue, 9 Jul 2002 03:30:34 -0700 (PDT)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.6/8.11.6) id g69AWUV27220
	for linux-mtd@lists.infradead.org; Tue, 9 Jul 2002 11:32:30 +0100
Message-Id: <200207091032.g69AWUV27220@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: Re: add_mtd_partition question
Date: Tue, 9 Jul 2002 11:32:30 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

So if there are no objections, I'll commit the following change...

Index: drivers/mtd/mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.27
diff -r1.27 mtdpart.c
231a232
>               slave->mtd.priv=master->priv;

----------  Forwarded Message  ----------

Subject: Re: add_mtd_partition question
Date: Fri, 5 Jul 2002 08:58:27 +0100
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org

Sorry, I meant slave->mtd.priv

On Friday 05 July 2002 8:32 am, Clive Davies wrote:
> Is there a reason why when you add a partition with add_mtd_partition
> master->priv doesn't get copied into slave->priv ? If not, does anyone
> object if I add it in? I'm trying to fix the read_user_prot_reg accesses
> which no longer seem to work for me.
>
> Clive

-------------------------------------------------------
