Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzPGx-00074y-3a
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:06:32 +0000
Received: by wwc33 with SMTP id 33so261990wwc.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Mar 2011 01:06:28 -0700 (PDT)
Subject: Re: gcc 4.5 and copy_flag in libubigen.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andre Naujoks <nautsch2@googlemail.com>
In-Reply-To: <4D7E4437.70300@googlemail.com>
References: <4D7E4437.70300@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Mar 2011 10:04:56 +0200
Message-ID: <1300176296.2740.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-14 at 17:37 +0100, Andre Naujoks wrote:
> Hi all.
> 
> I am compiling a board support package with mtd-utils-1.3.1.
> 
> After a gcc update to version 4.5 on my host the build fails and it
> tells me that:
> 
> ./src/libubigen.c: In function 'ubigen_write_leb':
> ./src/libubigen.c:204:19: error: operation on 'u->v->copy_flag' may be
> undefined.
> 
> This seems like a recently introduced warning by the new gcc version,
> but because of the -Werror halts my build.
> 
> I had a look into the source at ubi-utils/old-utils/src/libubigen.c and
> it says:

You are using old UBI utils, they are not supported for long time. They
were removed from the mtd-utils tree recently. Try to use the new UBI
utilities.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
