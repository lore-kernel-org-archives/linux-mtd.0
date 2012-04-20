Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLGeT-0001oc-UP
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 16:25:42 +0000
Message-ID: <4F918E00.90904@newsguy.com>
Date: Fri, 20 Apr 2012 09:25:36 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read, write}_page
 interfaces
References: <70E876B0EA86DD4BAF101844BC814DFE0BF6014363@Cloud.RL.local>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF6014363@Cloud.RL.local>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 "prabhakar@freescale.com" <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/19/2012 06:10 PM, Jon Povey wrote:
> 
> In theory nobody should ever need to worry about OOB+ECC but being able
> to fiddle with it has its uses and I hope that ability doesn't go away.


I think we're just trying to figure out how to make it optional.


Thanks,
Mike
