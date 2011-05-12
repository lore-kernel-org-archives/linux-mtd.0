Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKUXa-0001X9-SK
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 11:58:51 +0000
Received: by ewy3 with SMTP id 3so472442ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 04:58:49 -0700 (PDT)
Subject: Re: Removing CONFIG_MTD_PARTITIONS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <20110509095604.GA10860@pulham.picochip.com>
References: <20110509095604.GA10860@pulham.picochip.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 14:55:27 +0300
Message-ID: <1305201327.2713.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-09 at 10:56 +0100, Jamie Iles wrote:
> I've had a quick look at removing CONFIG_MTD_PARTITIONS so that MTD 
> partitioning is always enabled and the patch below is what I have so 
> far.

Thanks!

> At the moment this just always builds in partitioning support and 
> introduces mtd_device_{,un}register() (I'm not sure if these are the 
> best names).  These effectively replace 
> add_mtd_device()/add_mtd_partitions() and their deletion counterparts 
> and will register partitions if supplied, or the whole device if there 
> are no partitions.  I've also converted over a couple of mtd drivers, 
> and will do them all if this is the correct approach.
> 
> I've left CONFIG_MTD_PARTITIONS as a bool with no description to keep 
> the series bisectable - the final patch would remove it completely and 
> make add_mtd_device and add_mtd_partitions internal only symbols.  Does 
> this seem like a reasonable strategy?

Looks like. Could you please split this patch on a series of small and
easily reviewable patches?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
