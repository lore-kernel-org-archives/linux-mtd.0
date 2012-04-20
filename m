Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLJMg-0006hD-Rr
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 19:19:31 +0000
Received: by yenm10 with SMTP id m10so6070512yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 12:19:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F918E00.90904@newsguy.com>
References: <70E876B0EA86DD4BAF101844BC814DFE0BF6014363@Cloud.RL.local>
 <4F918E00.90904@newsguy.com>
Date: Fri, 20 Apr 2012 12:19:29 -0700
Message-ID: <CAN8TOE979m7Rt6xA_YonzHcK16GKWhn8KFf0UqZL=g=oebgX8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>, Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On Fri, Apr 20, 2012 at 9:25 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
> On 04/19/2012 06:10 PM, Jon Povey wrote:
>>
>> In theory nobody should ever need to worry about OOB+ECC but being able
>> to fiddle with it has its uses and I hope that ability doesn't go away.
>
>
> I think we're just trying to figure out how to make it optional.

Right, optional.

Brian
