Received: from forward9.mail.yandex.net ([2a02:6b8:0:202::4])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSQQf-0000Cc-M6
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 11:53:51 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>,
 "motobud@gmail.com" <motobud@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
References: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
Subject: Re: [PATCH v0] mkfs.ubifs: Add support for lz4hc compressor in
 mkfs.ubifs
MIME-Version: 1.0
Message-Id: <106341380974003@web15m.yandex.ru>
Date: Sat, 05 Oct 2013 15:53:23 +0400
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



05.10.2013, 10:53, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
> Brent et all,
>
> I was bored last night and while following the thread on the lz4hc
> compression for ubifs got my attention so I decided to give a go at
> implementing in. Below you can find a patch which does just that.
>
> An lz4hc and favor_lz4hc compr type, they mimick lzo and favor_lzo
> but use lz4hc instead of lzo.
>
> In order to use lz4hc I included 3 files from the lz4 project since
> lz4 is not yet available in a conventient modular form (suggestions
> to fix this are welcome).
>
> In the meantime I saw however that Brent was also considering adding
> lz4hc support mkfs.ubifs so I'm making a v0 zero post either to serve
> as input for review comment (mainly on handling the lz4 dependency)
> and then I'll take care of cleaning up and testing it myself, or just
> to serve as some reference to the implementation of Brent, let me know
> of you want some polishing up on this version or are already in an
> advanced phase of a solution of yourself.
>
> (Yes, it's called v0, it's still untested but I would like input on
> the lz4 dependency handling and the extension of the options, or
> do we see something feasible where we contain lzo/lz4hc and zlib on
> the fly, suggestions welcome).
>
> my 2 cents
> E.

Thank you very much!

Unfortunately, your patch does not apply cleanly. I've tried mtd-utils
master and v1.5.0, and got rejects in both cases.

-- 
Regards,
Konstantin
