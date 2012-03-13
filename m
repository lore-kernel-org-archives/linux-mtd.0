Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7WIc-0004gT-0c
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 18:18:18 +0000
Received: from [192.168.12.102] (246.sub-166-250-9.myvzw.com [166.250.9.246])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q2DIIEnt011061
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 11:18:15 -0700 (PDT)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4F5F813D.8090309@newsguy.com>
Date: Tue, 13 Mar 2012 10:17:49 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: MTD API locking and concurrency
References: <87obs1rr4b.fsf@free.fr>
In-Reply-To: <87obs1rr4b.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/12/2012 10:45 PM, Robert Jarzmik wrote:
> Hi,
> 
> I came across a concurrent usage of my MTD driver by UBIFS by doing
> an IOC_UBI_UPVOL. As my chip doesn't support multiple requests at a time, I need
> to protect the access to chip registers.


FYI, the nand infrastructure code handles this for its devices; see
nand_base.c::nand_get_device()

Mike
