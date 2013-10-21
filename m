Received: from forward16.mail.yandex.net ([2a02:6b8:0:1402::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYC81-0006tO-1W
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 09:50:26 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>,
 Brent Taylor <motobud@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <CAGWqfiip3ZXvS9K7LxOEoGy3J=+a81q=9L3Gz8FvoLCReO-LCg@mail.gmail.com>
References: <CAGWqfiip3ZXvS9K7LxOEoGy3J=+a81q=9L3Gz8FvoLCReO-LCg@mail.gmail.com>
Subject: Re: [PATCH v1] mtd-utils:mkfs.ubifs: Add support for LZ4HC compression
MIME-Version: 1.0
Message-Id: <242431382348997@web1g.yandex.ru>
Date: Mon, 21 Oct 2013 13:49:57 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



07.10.2013, 22:59, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
> All,
>
> After some more experimentation and some input from Konstantin
> attached is a new version of a patch to mtd-utils which adds LZ4HC
> support to mkfs.ubifs:
>
> What's new:
> š- favor_lz4hc is changed to toggle between lz4hc/lzo rather than
> lz4hc/zlib in order to come up with a mode which should be both flash
> and cpu friendly, mainly since our experiments showed that lz4hc isn't
> a free lunch by default (read: probably starts paying of at larger
> block lengths than what we can offer it now).
>
> Some tests of this new mode at different favor-percents shows that for
> my little rootfs that with a favor percent of 10%, lz4hc gets used in
> about 17% of the cases with a footprint which is within a meg's range
> of what lzo would've done to it.
>
> edb@lapelidb:~/mtd-utils$ for x in 20 15 10 7 5 3; do šecho $x; sudo
> mkfs.ubifs/mkfs.ubifs š-X $x -x favor_lz4hc -m 2048 -e 126976 -c 744
> -d /tmp/k/ /tmp/imag.favor_lz4hc_$x | sort | uniq -c; ls -hal
> /tmp/imag.favor_lz4hc_$x ; done

Side note: there is no need to run mkfs.ubifs under root. Just add
/usr/sbin or /usr/local/sbin to your path.

-- 
Regards,
Konstantin
