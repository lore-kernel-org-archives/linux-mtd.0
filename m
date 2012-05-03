Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPzYy-0001su-En
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 17:11:32 +0000
Received: from [192.168.12.102] (74.sub-166-250-11.myvzw.com [166.250.11.74])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q43HBSZA021100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Thu, 3 May 2012 10:11:29 -0700 (PDT)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4FA2BC40.70504@newsguy.com>
Date: Thu, 03 May 2012 10:11:28 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 00/10] mtd: nand: rework nand_ecc_ctrl interface for OOB
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1336039230.13013.14.camel@sauron.fi.intel.com>
In-Reply-To: <1336039230.13013.14.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/03/2012 03:00 AM, Artem Bityutskiy wrote:
> On Wed, 2012-05-02 at 10:14 -0700, Brian Norris wrote:
>> Hello,
>>
>> This is the fourth version of my patches to change the nand_chip and
>> nand_ecc_ctrl interfaces so that the nand_ecc_ctrl functions have information
>> about whether the higher layers actually need OOB data to be read/written
>> from/to the NAND device.
> 
> Pushed patches 1,2,6,7,8,9 to l2-mtd.git, thanks!
> 


I compile-tested these patches on all arches.  No warnings or errors on the
files that were touched.

Mike
