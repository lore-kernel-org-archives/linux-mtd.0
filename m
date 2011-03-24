Received: from webbox687.server-home.net ([195.149.74.151])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2fEC-0005yW-RG
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 07:45:09 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
Date: Thu, 24 Mar 2011 08:45:04 +0100
References: <4D797E23.6070409@emcraft.com>
In-Reply-To: <4D797E23.6070409@emcraft.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201103240845.04902.alexander.stein@systec-electronic.com>
Cc: Ilya Yanok <yanok@emcraft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Friday 11 March 2011, 02:42:59 Ilya Yanok wrote:
> current cfi_cmdset_0002.c code does not implement handling of error
> statuses reported by the chip during write/erase and just waits for a
> software timeout instead.
> 
> We think that proper handling of these conditions could help us to debug
> the issue we have with the NOR flash and UBIFS so we'd like to implement
> such handling.
> 
> I've tried to do this, please see my initial patch below. For now errors
> are just reported via pr_debug().
> 
> I'd like to hear any comments. Am I doing things right or not? Maybe I'm
> missing something?

I'm not that much into these cfi commands, but does this status check address 
immediate finished flash erases?
Let me explain: We have a NOR-Flash partition used for UBIFS. We noticed 
ubiformat takes about 11 minutes to format it (~100MiB). In u-boot ubi create 
takes about 2 _seconds_ iff the partition has been erased before.
If the flash hasn't been erased before it takes about the same time.
It seems u-boot can detect if the flash is already ready after invoking a 
erase command on an empty sector while linux doesn't.
I once checked the erase/format time for 1 sector in ubiformat:
non-empty sector: ~1s
empty-sector:    0.5s

Regards,
Alexander
