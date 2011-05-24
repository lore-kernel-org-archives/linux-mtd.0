Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOkSk-000573-8S
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 05:47:27 +0000
Received: by ewy3 with SMTP id 3so2344744ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 22:47:24 -0700 (PDT)
Subject: Re: [PATCH 00/62] Remove CONFIG_MTD_PARTITIONS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 08:43:06 +0300
Message-ID: <1306215786.2785.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-23 at 10:22 +0100, Jamie Iles wrote:
> This series remove the configuration option CONFIG_MTD_PARTITIONS so that
> partitioning support is always enabled in the kernel.  A new set of symbols
> for registering MTD devices (mtd_device_register()/mtd_device_unregister())
> are introduced that replace add_mtd_device()/add_mtd_partitions() and their
> removal counterparts and the preprocessor conditionals in drivers are removed
> so that we can always register partitions.
> 
> Most of the driver changes are only compile tested but physmap and gpio-nand
> have been tested on hardware.
> 
> This series is based on next-20110519 so that the new lantiq driver can be
> converted.  There are a couple of small conflicts with Artem's tree but are
> fairly easily resolved.

Pushed the whole series to l2-mtd-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
