Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17RvFs-0006mE-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2002 14:42:12 +0100
Message-Id: <200207091340.g69DexW01174@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: add_mtd_partition question
Date: Tue, 9 Jul 2002 14:40:59 +0100
Cc: linux-mtd@lists.infradead.org
References: <200207091032.g69AWUV27220@localhost.localdomain> <15331.1026217135@redhat.com>
In-Reply-To: <15331.1026217135@redhat.com>
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

> Er, why? It's private to the underlying MTD driver, and all the partition
> wrappers should be passing the _original_ mtd_info to the underlying
> driver, shouldn't they?

Ok, I think I see where I've gone wrong. I'll try and fix it properly and 
then submit the changes for you to check for sanity.
