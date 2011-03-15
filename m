Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQRP-0007fa-Lq
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 09:21:24 +0000
Received: by gxk2 with SMTP id 2so159951gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Mar 2011 02:21:22 -0700 (PDT)
Message-ID: <4D7F2F8E.10608@googlemail.com>
Date: Tue, 15 Mar 2011 10:21:18 +0100
From: Andre Naujoks <nautsch2@googlemail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: gcc 4.5 and copy_flag in libubigen.c
References: <4D7E4437.70300@googlemail.com> <4D7E5601.6090905@parrot.com>	
	<4D7F1B8C.2080303@googlemail.com>
	<1300176400.2740.2.camel@localhost>
In-Reply-To: <1300176400.2740.2.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 15.03.2011 09:06, schrieb Artem Bityutskiy:
> On Tue, 2011-03-15 at 08:55 +0100, Andre Naujoks wrote:
>> Am 14.03.2011 18:53, schrieb Matthieu CASTET:
>>> Andre Naujoks a écrit :
>>>> Hi all.
>>>>
>>>> I am compiling a board support package with mtd-utils-1.3.1.
>>>>
>>> Why don't you update your mtd-utils version ?
>>
>> Because it would be more of a hassle and a risk to do that. There are
>> patches applied that were build from the suppliers of the BSP, which I
>> would have to possibly reproduce for a newer version. As far as I can
>> see, they are all patches to the build system, but nevertheless.
> 
> Well, you can use 1.3.1, but do not use old UBI utils, use the new ones,
> i.e., use ubi-utils/src/libubigen.c, not
> ubi-utils/old-utils/src/libubigen.c
> 

Thank You. That helped a lot. I just removed SUBDIRS from the Makefile
in ubi-utils. It seems as if those were not used at all from the beginning.

Sorry for the noise for something that old I did not even use :-)

Thanks for the help
  Andre
