Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzP6n-00071b-18
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 07:56:01 +0000
Received: by bwz1 with SMTP id 1so342517bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Mar 2011 00:55:59 -0700 (PDT)
Message-ID: <4D7F1B8C.2080303@googlemail.com>
Date: Tue, 15 Mar 2011 08:55:56 +0100
From: Andre Naujoks <nautsch2@googlemail.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: gcc 4.5 and copy_flag in libubigen.c
References: <4D7E4437.70300@googlemail.com> <4D7E5601.6090905@parrot.com>
In-Reply-To: <4D7E5601.6090905@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 14.03.2011 18:53, schrieb Matthieu CASTET:
> Andre Naujoks a écrit :
>> Hi all.
>>
>> I am compiling a board support package with mtd-utils-1.3.1.
>>
> Why don't you update your mtd-utils version ?

Because it would be more of a hassle and a risk to do that. There are
patches applied that were build from the suppliers of the BSP, which I
would have to possibly reproduce for a newer version. As far as I can
see, they are all patches to the build system, but nevertheless.

The current version is the version I would stick to just because it
takes the maintenance of the package of of me. I would rather add a
little patch myself instead of handling the whole package.

I additionally have no idea about the implications an update of this
particular package would have. It just broke, because the gcc people
decided a new warning was a good idea.

Andre

> 
> 
> Matthieu
