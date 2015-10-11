Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlMrA-0004Sn-GW
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2015 20:04:33 +0000
Received: by qgeb31 with SMTP id b31so5998954qge.0
 for <linux-mtd@lists.infradead.org>; Sun, 11 Oct 2015 13:04:11 -0700 (PDT)
Date: Sun, 11 Oct 2015 13:04:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 4/5] mtd: ofpart: document the lock flag.
Message-ID: <20151011200412.GF3696@localhost>
References: <cover.1439911625.git.hramrach@gmail.com>
 <83fbf31ad895446837f8e01f77a1ff7c63d62251.1439911625.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83fbf31ad895446837f8e01f77a1ff7c63d62251.1439911625.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 03:34:08PM -0000, Michal Suchanek wrote:
> The lock flag of ofpart is undocumented. Add to binding doc.

Good catch. There are a lot of small corners of very old code that never
really got reviewed properly, I expect...

(And the flag looks very odd. Why exactly is it in the partitions?)

And now that I'm looking further...does this flag even *do* anything?
AFAICT, it doesn't set the master device flags -- only the partition
flags. But MTD drivers currently never see the partition flags -- they
only see the master struct mtd_info. I think the only way anyone could
observe the effect of this flag is to read the MTD flags from sysfs. And
that's pretty useless.

If my understanding is correct, then I'd rather completely remove the
code that "handles" this flag, rather than codify it in the docs.

> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/partition.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 8c2aff7..7fa9c08 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -29,6 +29,7 @@ Optional properties:
>    partition should only be mounted read-only. This is usually used for flash
>    partitions containing early-boot firmware images or data which should not be
>    clobbered.
> +- lock : Clear always locked after reset flag

This seems more like a SW description. I've reworded slightly locally.

Is my above analysis sensible? If so, I'll patch this to kill the DT
parsing code for "lock" entirely. If I'm wrong, then I can push this
patch. Let me know what you think.

Brian

P.S. IIUC, then most of the 'mask_flags' stuff for partitioned devices
really does nothing. These flags don't seem to ever be checked. Ugh.
