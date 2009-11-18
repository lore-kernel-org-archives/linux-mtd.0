Received: from smtp-vbr9.xs4all.nl ([194.109.24.29])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NAiGY-0005w7-Mm
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 11:00:07 +0000
Message-ID: <4B03D39F.9020204@aimvalley.nl>
Date: Wed, 18 Nov 2009 11:59:43 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
References: <4B012D0D.4080500@aimvalley.nl>	
	<1258446318.27437.60.camel@localhost>
	<4B02CE86.5000908@aimvalley.nl>	
	<1258532918.27437.126.camel@localhost>
	<4B03BDBD.3040409@aimvalley.nl>	
	<1258537224.27437.193.camel@localhost>	
	<OF0C424CF9.C5017633-ONC1257672.003A3412-C1257672.003A6DE6@transmode.se>
	<1258541677.27437.196.camel@localhost>
In-Reply-To: <1258541677.27437.196.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

>>>>>
>>>> The solution is to enable erase-suspend for writing for which
>>>> Joakim already sent earlier patches.
>>>> So if it's OK with him I will send the patch for cmdset_0002.
>> I am fine with that, I sent them earlier because I wanted someone
>> with cmdset_0002 to pick them up, test and submit.
>>
>>> Why his patch is not in upstream yet? I think he mentioned some issues
>>> with modules.
>> Nope, that was a another JFFS2 issue. Not related to this.
> 
> I'm do not know CFI, but if you or Norbet re-submit the patch with CC to
> Nicolas, put some good description which problems it solves, tell that
> you tested it, I can help merging it by putting it to my l2-mtd-2.6.git.
> 

OK, I will do that.

thanks,
Norbert.
