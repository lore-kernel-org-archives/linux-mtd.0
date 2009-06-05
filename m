Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCZ4o-0000pq-ON
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 13:03:26 +0000
Subject: Re: about ubifs
From: tommy <jiujin.hong@mid-fun.com>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
References: <1244204035.18630.0.camel@tommy-desktop>
	<71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2009 21:03:14 +0800
Message-Id: <1244206994.20718.7.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

no,i didn't fsync when i close file !

did ubifs driver can achieve "fsync" when user modify some file and
close with save ?

if system have no power and shutdown system forcely ,user's file will
become no contents in some case ,how did we protect this ?

thanks!


On 五, 2009-06-05 at 14:42 +0200, Corentin Chary wrote:
> On Fri, Jun 5, 2009 at 2:13 PM, tommy<jiujin.hong@mid-fun.com> wrote:
> > Dear all,i have found a question about ubifs and sync !
> >
> > Question is following;
> >
> > Artem,
> > What i do is just open an existing file in a UBIFS formated UBI volume
> > on a Nand Flash,
> >
> > add a few lines to it ,close the file ,then without unmounting the
> > filesystem and reboot the filesystem.
> >
> > When my board reboots and i looked at that file ,it's zero length and
> > has no contents.I suspect it's because
> >
> > UBIFS does less frequent syncs .it just lost content of the file because
> > there's no sync before the reboot!
> >
> > How can i solve this ?
> >
> 
> Hi,
> Do you use fsync() before closing the file ?
> You can read http://thunk.org/tytso/blog/2009/03/15/dont-fear-the-fsync/
> for more information. It's for ext4, but I think the problem is the
> same.
> 
> 
> 
