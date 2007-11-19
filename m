Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iu6xD-0006KE-Le
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 08:46:30 -0500
Message-ID: <474191E7.1060406@nokia.com>
Date: Mon, 19 Nov 2007 15:38:47 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: haver@vnet.ibm.com
Subject: Re: ubi-utils: unubi fixes and enhancements
References: <1194267534.13736.10.camel@august> <1195463030.1119.7.camel@sauron>
In-Reply-To: <1195463030.1119.7.camel@sauron>
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

Artem Bityutskiy wrote:
> On Mon, 2007-11-05 at 13:58 +0100, Frank Haverkamp wrote:
>> Hi Artem,
>>
>> some time ago Drake Dawsett, a student working for us, has done some
>> bug-fixes and enhancements to the unubi tool. He forgot to send them out
>> before he left us. I have reworked them for integration:
>>
>>   git://git.infradead.org/users/haver/mtd-utils.git
>>
>> Please have a look, and pull them if you are fine with them.
> 
> Hi guys, sorry, I was away, will handle this soon.

It does not compile for me:

gcc -I./inc -I./src -I../include -O2 -g -Wall -Werror -Wwrite-strings -W 
-std=gnu99 -DPACKAGE_VERSION=\"1.0\" -g -c -o nand2bin.o ./src/nand2bin.c -g 
-Wp,-MD,.nand2bin.c.dep
gcc -I./inc -I./src -I../include -O2 -g -Wall -Werror -Wwrite-strings -W 
-std=gnu99 -DPACKAGE_VERSION=\"1.0\" -g -c -o nandcorr.o ./src/nandcorr.c -g 
-Wp,-MD,.nandcorr.c.dep
gcc  -o nand2bin nand2bin.o nandecc.o nandcorr.o
make[1]: *** No rule to make target `src/eb_chain.h', needed by `unubi.o'.  Stop.
make[1]: Leaving directory `/home/dedekind/git/mtd-utils.git/ubi-utils'
make: *** [all] Error 2

Could you please fix this and also rebase against newer mtd-utils.git?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
