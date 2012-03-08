Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5ftJ-00040g-CT
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 16:08:34 +0000
Received: by wgbdr1 with SMTP id dr1so424117wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 08 Mar 2012 08:08:31 -0800 (PST)
Date: Thu, 8 Mar 2012 18:08:26 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] UBI: allocate verification buffer on demand
Message-ID: <20120308180826.53123148@halley>
In-Reply-To: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
References: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu,  8 Mar 2012 16:14:50 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
> 
> Remove the pre-allocated 'peb_buf2' buffer because we do not really need it.
> The only reason UBI has it is to check that the data were written correctly.
> But we do not have to have 2 buffers for this and waste RAM - we can just
> compare CRC checksums instead.
> 
> Artem bityutskiy: massaged the patch and commit message
> 
> Signed-off-by: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Josselin's original title "allocate verification buffer on demand" does
no longer describe this patch.
Should be "Remove the pre-allocated 'peb_buf2'" or alike.

Regards,
Shmulik
