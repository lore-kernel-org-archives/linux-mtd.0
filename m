Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avqii-00072h-9X
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 18:31:25 +0000
Subject: Re: [PATCH] UBI: Add ro-mode sysfs attribute
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1461868087-681-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <572256E3.7030404@nod.at>
Date: Thu, 28 Apr 2016 20:30:59 +0200
MIME-Version: 1.0
In-Reply-To: <1461868087-681-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.04.2016 um 20:28 schrieb Ezequiel Garcia:
> On certain situations, UBI may detect serious device corruption,
> and switch to read-only mode to protect the data and allow debugging.
> This commit exposes this ro-mode on sysfs, so it can be obtained
> by userspace tools.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Makes sense. Please also document the new attribute in
Documentation/ABI/stable/sysfs-class-ubi,

Thanks,
//richard
