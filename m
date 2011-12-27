Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rfdbk-000529-6N
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 20:26:48 +0000
Message-ID: <4EFA29E4.1020803@newsguy.com>
Date: Tue, 27 Dec 2011 12:26:12 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] MTD: drivers return bitlip info to mtd on read
References: <1324928293-17905-1-git-send-email-mikedunn@newsguy.com>
 <1324974817.1165.51.camel@sauron.fi.intel.com>
In-Reply-To: <1324974817.1165.51.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Scott Branden <sbranden@broadcom.com>, Joern Engel <joern@logfs.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Jiandong Zheng <jdzheng@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/27/2011 12:33 AM, Artem Bityutskiy wrote:
> On Mon, 2011-12-26 at 11:38 -0800, Mike Dunn wrote:
>> This patch changes the meaning of the value returned by the read() and
>> read_oob() mtd driver methods.  Previously, absent a hard error, these functions
>> returned either -EUCLEAN (one or more bitflips were corrected) or 0 (no
>> bitflips).  Drivers now return, absent a hard error, the maximum number of
>> bitflips that were corrected on any one page.  
>>
>> This change is made possible by the fact that all calls to the driver methods
>> now go through mtd wrapper functions.  The values returned by those wrapper
>> functions have not changed, nor have their meaning.  Only the values returned to
>> the mtd wrappers by the driver have changed.
>>
>> Tested with nandsim and onenand_sim.  The two drivers that were modified were
>> compile-tested only.
>>
>> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
> Hi, I am not sure using the return code is a good way for this.


OK.  It was a little kludgey, but had the advantage of touching very few drivers
and leaving the existing function prototypes unchanged.


> But please, proceed with working on your issues - this patch is not
> going to hit 3.2 anyway - I think it is the 3.3 material. Linus promised
> 3.2 release this week, then we have the merge window, and then it is
> time for further patches in this area.
>
> I will do the other changes which I described in my cover letter. I
> will also make a patch which adds a bitflips parameter to read/read_oob
> and then you will implement 
>
> But please, just make something which works for you for now and go on
> with other DoC issues you have. Meantime I'll prepare the MTD basis
> for you.
>
> I think I'll first do the 3 items I described in my series. Then I'll
> add "bitflips" parameter to read/read_oob() functions, but won't
> implement or ever check it. After this you'll add your code.
>
> How does this sound to you?


Sure, you're the boss.  I appreciate your attention on this.  If you like, I'd
be happy to submit a patch that adds the max_bitflips argument to  read() and
read_oob() after you finish the cleanup and consolidation made possible by the
wrappers.  I've already done this work.  Your choice; let me know.

Thanks again,
Mike
