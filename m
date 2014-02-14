Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEGrY-0006E4-Cy
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 11:23:21 +0000
Message-ID: <1392376974.12215.78.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 14 Feb 2014 13:22:54 +0200
In-Reply-To: <20140214091148.GA30044@shlinux2.ap.freescale.net>
References: <1392365295-19299-1-git-send-email-b32955@freescale.com>
 <1392369532.12215.61.camel@sauron.fi.intel.com>
 <20140214091148.GA30044@shlinux2.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2014-02-14 at 17:11 +0800, Huang Shijie wrote:
> But if we do not have any _slave_ partitions, we will only have one
> master partition.
> and the numeraseregions is kept. this is the case i meet.

Why you prefer to change UBI instead of changing MTD so that master
partitions with no slave partitions would have numeraseregions=0.

And frankly, I did not clearly understand your answer.

And what erase regions have to do with master/slave?

Correct me if I am wrong below.

The erase region concept belongs to the flash chip. Some chips have
special regions, for some special purposes, and these, typically small,
regions have a bit different geometry.

Master/slave is a purely software concept. I never clearly understood
the model, but this is something related to partitions. We have a master
MTD device representing the entire chip, and slave MTD devices
representing partitions.

In your explanation you mix these 2 unrelated concepts, and I do not
understand why.

Yes, I could go and dig the code, but I prefer the patch submitter to
educate me instead, and demonstrate the depth of his understanding of
the subject :=) Sorry, I am lazy :-)

-- 
Best Regards,
Artem Bityutskiy
