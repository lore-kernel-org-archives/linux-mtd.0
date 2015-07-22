Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHnzZ-000194-K0
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 06:59:02 +0000
Message-ID: <55AF3F1A.7080509@nod.at>
Date: Wed, 22 Jul 2015 08:58:34 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 jack@suse.com
CC: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 00/25] Add quota supporting in ubifs
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55AEB685.9030904@nod.at> <55AEEAC7.9080307@cn.fujitsu.com>
In-Reply-To: <55AEEAC7.9080307@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 22.07.2015 um 02:58 schrieb Dongsheng Yang:
>> I get this lockdep splat. Have you seen it too?
> 
> OMG, could you share the script to trigger it?

Bash history says:
  495  mount -t ubifs /dev/ubi0_0 /mnt -o usrquota,grpquota
  496  quotacheck -ug /mnt
  497  quotaon /mnt
  498  setquota root 10 10 3 3 /mnt
  499  dd if=/dev/urandom of=/mnt/xx bs=1M

So, basically your testing. :)
But on my UBI/FS testbad I have locked enabled by default.

BTW: If you face this splat you can ignore it:
http://lists.infradead.org/pipermail/linux-mtd/2015-July/060056.html

Thanks,
//richard
