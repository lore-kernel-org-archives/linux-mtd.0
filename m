Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOiZZ-00054Y-0y
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 06:27:41 +0000
Received: by mail-pd0-f181.google.com with SMTP id g10so5603397pdj.40
 for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2013 23:27:18 -0700 (PDT)
Message-ID: <52428241.6030907@gmail.com>
Date: Tue, 24 Sep 2013 23:27:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130924185933.GC5423@localhost>
In-Reply-To: <20130924185933.GC5423@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 09/24/2013 11:59 AM, Ezequiel Garcia wrote:
> On Thu, Sep 19, 2013 at 01:01:24PM -0300, Ezequiel Garcia wrote:
>> As some of you know, I'm working on implementing the long-awaited NAND
>> support in Armada 370/XP SoCs.

...

> If you're not too busy, I'd like you to take a look at the implementation.

Yes, I plan to look at this soon. I *might* have time tomorrow. But if 
my delay is too long for your taste, feel free to send v2.

> I'm preparing a new v2 which some (very minor) improvements, mainly to
> add support for timings configuration.

I believe Daniel reported a bug w/ PIO vs. DMA. I presume this will be 
in v2? If those modifications aren't too big, then I can look at the 
current series.

> If there's anything to fix or to re-work, don't hesitate in asking!

Of course!

Brian
