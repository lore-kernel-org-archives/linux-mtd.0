Received: from an-out-0708.google.com ([209.85.132.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOykx-0000EV-Cn
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 17:49:35 +0000
Received: by an-out-0708.google.com with SMTP id c24so187229ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Aug 2008 10:49:34 -0700 (PDT)
Subject: Re: [PATCH 10/10] mtd: remove code associated with !CONFIG_PPC_MERGE
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1217609060-6381-11-git-send-email-galak@kernel.crashing.org>
References: <1217609060-6381-1-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-2-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-3-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-4-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-5-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-6-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-7-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-8-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-9-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-10-git-send-email-galak@kernel.crashing.org>
	<1217609060-6381-11-git-send-email-galak@kernel.crashing.org>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 13:49:30 -0400
Message-Id: <1217612970.2328.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: Josh Boyer <jwboyer@gmail.com>
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Reply-To: jwboyer@linux.vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-01 at 11:44 -0500, Kumar Gala wrote:
> Now that arch/ppc is gone we don't need CONFIG_PPC_MERGE anymore
> remove the dead code associated with !CONFIG_PPC_MERGE.
> 
> The mtd maps should be using the OF based mechanism.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Acked-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>
