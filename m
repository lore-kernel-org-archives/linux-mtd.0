Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IwAe5-0004if-IM
	for linux-mtd@lists.infradead.org; Sun, 25 Nov 2007 01:07:15 -0500
Message-ID: <474910F1.1050302@nokia.com>
Date: Sun, 25 Nov 2007 08:06:41 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: haver@vnet.ibm.com
Subject: Re: ubi-utils: unubi fixes and enhancements
References: <1194267534.13736.10.camel@august>	
	<1195463030.1119.7.camel@sauron> <474191E7.1060406@nokia.com>
	<1195899076.8798.7.camel@august>
In-Reply-To: <1195899076.8798.7.camel@august>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank Haverkamp wrote:
>> gcc -I./inc -I./src -I../include -O2 -g -Wall -Werror -Wwrite-strings
>> -W 
>> -std=gnu99 -DPACKAGE_VERSION=\"1.0\" -g -c -o
>> nandcorr.o ./src/nandcorr.c -g 
>> -Wp,-MD,.nandcorr.c.dep
>> gcc  -o nand2bin nand2bin.o nandecc.o nandcorr.o
>> make[1]: *** No rule to make target `src/eb_chain.h', needed by
>> `unubi.o'.  Stop.
>> make[1]: Leaving directory
>> `/home/dedekind/git/mtd-utils.git/ubi-utils'
>> make: *** [all] Error 2
> 
> I had removed the src/eb_chain.h file. I renewed my git and tried my
> patches with a clean checkout. It works for me. Can it be that our
> dependency-checking is broken and you did not do make clean before you
> tried compiling?

Sorry Frank, my fault. Committed, thank you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
