Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTW0P-0008DL-8m
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:21:54 +0000
Received: by wwb39 with SMTP id 39so2803373wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:21:51 -0700 (PDT)
Message-ID: <4DEC9C27.7070508@gmail.com>
Date: Mon, 06 Jun 2011 13:21:43 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 041/104] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>	
	<1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
	<1307347548.3135.31.camel@localhost>
In-Reply-To: <1307347548.3135.31.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06.06.2011 12:05, Artem Bityutskiy wrote:
> On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
>> Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
>> 1) Register ofpart parser
>> 2) Internally don't use passed device for error printing
>> 3) Add device_node to mtd_info struct
>> 4) Move of_mtd_parse_partitions from __devinit to common text section
>> 5) add ofpart to the default list of partition parsers
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>
> Do not apply this and further changes so far - I had some questions.
>
> Anyway, your series consists of as set of logical steps, which is really
> nice, so let's finish with the first cmdline consolidation step, and
> then move on.

BTW: what about fixing order of parsing to:
cmdlinepart,
RedBoot,
afs,
ofpart/ofoldpart,
platform-default-hook.

This will allow me to drop "parse order" options from all relevant 
functions.

-- 
With best wishes
Dmitry
