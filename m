Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmfzK-000157-VG
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 09:37:51 +0000
Message-ID: <1415353027.958.296.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] UBI: Implement UBI_METAONLY
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 07 Nov 2014 11:37:07 +0200
In-Reply-To: <1414594338-14695-1-git-send-email-richard@nod.at>
References: <1414594338-14695-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Murray <amurray@embedded-bits.co.uk>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-10-29 at 15:52 +0100, Richard Weinberger wrote:
> + * UBI_METAONLY: modify voulme meta data only

Can we please have a bit extended comment for this, explaining what
meta-data is? Like

UBI_METAONLY: modify only the volume meta-data, i.e. the data stored in
              the volume table, but not in any of volume LEBs.
