Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181Sle-0007Qp-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 15:33:54 +0100
Message-Id: <200210151432.g9FEWZP22889@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>, cdavies@infradead.org
Subject: Re: mtd/drivers/mtd/chips cfi_cmdset_0002.c,1.58,1.59
Date: Tue, 15 Oct 2002 15:32:35 +0100
Cc: linux-mtd@lists.infradead.org
References: <E181S0Q-0006XW-00@phoenix.infradead.org> <19808.1034691151@passion.cambridge.redhat.com>
In-Reply-To: <19808.1034691151@passion.cambridge.redhat.com>
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

On Tuesday 15 October 2002 3:12 pm, David Woodhouse wrote:
> cdavies@infradead.org said:
> +	mtd->read_user_prot_reg = cfi_amdstd_secsi_read;
> +	mtd->read_fact_prot_reg = cfi_amdstd_secsi_read;
>
> Can't we make this conditional on the flash type, and refrain from checking
> it at runtime?

Do you mean check the mfr & id here and only assign these if the chip has a 
secsi area? 
