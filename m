Received: from ag-out-0708.google.com ([72.14.246.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JePnA-0000kd-JR
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 07:11:25 +0000
Received: by ag-out-0708.google.com with SMTP id 33so6933928agc.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Mar 2008 00:11:23 -0700 (PDT)
Message-ID: <45e8e6c40803260011x539beceh7819ad97d1fdbfde@mail.gmail.com>
Date: Wed, 26 Mar 2008 00:11:23 -0700
From: "Andrey Yurovsky" <andrey@cozybit.com>
To: Aneesh <aneesh_g@cms.com>
Subject: Re: MTD
In-Reply-To: <1206503909.3091.2.camel@Aneesh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1206503909.3091.2.camel@Aneesh>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please see the FAQ:
http://www.linux-mtd.infradead.org/faq/jffs2.html#L_magicnfound

On Tue, Mar 25, 2008 at 8:58 PM, Aneesh <aneesh_g@cms.com> wrote:
>
>
>  Hello,
>         I am Using an arm9 processor(kernel 2.6.24) and tried to
>  implement JFFS2 in parallel flash for data storage.but it failed .
>  my parallel flash is AT49BV642DT .First i erased the flash and mounted
>  to a drive .then i created a file there .After that i unmounted the
>  drive .and
>   when i am trying to mount the jffs2 again  ,It is showing an error like
>  follows
>  "Magic bitmask 0x1985 not found at 0x007e0078:  0x6d63 instead  "
>  can you help me to solve this problem ?
>                                                     Regards
>                                                             Aneesh.
>
>
>  ______________________________________________________
>  Linux MTD discussion mailing list
>  http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Andrey Yurovsky
cozybit Inc.
p 415 974 6770 x14
f 415 974 6771
e andrey@cozybit.com
