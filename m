Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181SR4-0007PE-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 15:12:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E181S0Q-0006XW-00@phoenix.infradead.org> 
References: <E181S0Q-0006XW-00@phoenix.infradead.org> 
To: cdavies@infradead.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/chips cfi_cmdset_0002.c,1.58,1.59 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 15:12:31 +0100
Message-ID: <19808.1034691151@passion.cambridge.redhat.com>
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

cdavies@infradead.org said:
+	mtd->read_user_prot_reg = cfi_amdstd_secsi_read;
+	mtd->read_fact_prot_reg = cfi_amdstd_secsi_read;

Can't we make this conditional on the flash type, and refrain from checking 
it at runtime?

--
dwmw2
