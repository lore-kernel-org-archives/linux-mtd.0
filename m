Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCYkR-0007vQ-CP
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 12:42:21 +0000
Received: by bwz4 with SMTP id 4so1561702bwz.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jun 2009 05:42:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244204035.18630.0.camel@tommy-desktop>
References: <1244204035.18630.0.camel@tommy-desktop>
Date: Fri, 5 Jun 2009 14:42:12 +0200
Message-ID: <71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
Subject: Re: about ubifs
From: Corentin Chary <corentin.chary@gmail.com>
To: tommy <jiujin.hong@mid-fun.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 5, 2009 at 2:13 PM, tommy<jiujin.hong@mid-fun.com> wrote:
> Dear all,i have found a question about ubifs and sync !
>
> Question is following;
>
> Artem,
> What i do is just open an existing file in a UBIFS formated UBI volume
> on a Nand Flash,
>
> add a few lines to it ,close the file ,then without unmounting the
> filesystem and reboot the filesystem.
>
> When my board reboots and i looked at that file ,it's zero length and
> has no contents.I suspect it's because
>
> UBIFS does less frequent syncs .it just lost content of the file because
> there's no sync before the reboot!
>
> How can i solve this ?
>

Hi,
Do you use fsync() before closing the file ?
You can read http://thunk.org/tytso/blog/2009/03/15/dont-fear-the-fsync/
for more information. It's for ext4, but I think the problem is the
same.



-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
