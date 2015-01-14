Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBSNV-0006P7-FL
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 18:09:14 +0000
Received: by mail-ig0-f173.google.com with SMTP id r10so10718069igi.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 10:08:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
Date: Wed, 14 Jan 2015 10:08:51 -0800
Message-ID: <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To initialize the partitions, it takes me 3.5s with this config option
turned on and .2s with the config option turned off. So a large
proportion of the NAND startup time (not counting ubi coming up) is
comes from this bad block scan. It takes about 1.87s to scan over the
device, and I have my partitioning set up so there's an extra
partition covering the whole device in addition to the individual
partitions.

Dan

On Tue, Jan 13, 2015 at 11:47 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Wed, 14 Jan 2015, Dan Ehrenberg wrote:
>
>> Each partition on a device with bad blocks iterates over its erase
>> blocks to find an accurate count of bad blocks. The iteration can take
>> some time, especially on devices with many erase blocks which are
>> configured to use the OOB area to detect if the block is bad. This
>> patch makes a config option, MTD_PART_BAD_BLOCK_COUNT, which can
>> be turned off to skip the initial scan and forgo an accurate count.
>
> How much time would you actually save? Sure, there number of blocks in a
> modern flash is in the thousands, but one only has to read the OOB of the
> first page to find the bad block marker, so scanning through the whole
> flash does not take long.
>
> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
