Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4aPy-00062J-3q
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 15:01:15 +0000
Message-ID: <4D91F432.2070406@oracle.com>
Date: Tue, 29 Mar 2011 08:01:06 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] ubifs: fix kconfig dependency warning
References: <20110328134016.deb5d0c8.randy.dunlap@oracle.com>
	<1301382178.2816.69.camel@localhost>
In-Reply-To: <1301382178.2816.69.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/11 00:02, Artem Bityutskiy wrote:
> On Mon, 2011-03-28 at 13:40 -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> Fix another kconfig dependency warning, this time in ubifs.
>>
>> warning: (UBIFS_FS_DEBUG && LOCKDEP && LATENCYTOP) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)
>>
>> Without this patch, we can have:
>> # CONFIG_KALLSYMS is not set
>> CONFIG_KALLSYMS_ALL=y
>> which is useless (does nothing unless KALLSYMS is enabled).
>>
>> However, ubifs builds successfully with or without this patch,
>> and it builds with this line completely deleted,
>> so what was this 'select' for?  Just developer convenience?
> 
> Well, here is the idea. You can compile UBIFS with debugging and without
> debugging. Without debugging the resulting ubifs.ko is much smaller, so
> some embedded people prefer it this way.
> 
> If you select debugging support, then we'll compile it a lot of
> assertions, self-checks, test-modes, extra error messages with detailed
> dumps. And we want to see stackdumps when errors or problems happen,
> this is why we select KALLSYMS_ALL.
> 
> So I guess instead we should do:
> 
> select KALLSYMS
> select KALLSYMS_ALL

Yes, that should do it.  Thanks for the explanation.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
