Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzBjy-0002bN-WF
	for linux-mtd@lists.infradead.org; Wed, 29 Apr 2009 15:30:50 +0000
Subject: Re: [PATCH, UBI] ubi notifications
From: dmitry pervushin <dpervushin@embeddedalley.com>
To: dedekind@infradead.org
In-Reply-To: <1240644884.22645.90.camel@localhost.localdomain>
References: <1240609183.32546.19.camel@hp.diimka.lan>
	<1240644884.22645.90.camel@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 29 Apr 2009 19:29:33 +0400
Message-Id: <1241018973.20184.32.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patchset is in next three messages

On Sat, 2009-04-25 at 10:34 +0300, Artem Bityutskiy wrote:
> On Sat, 2009-04-25 at 01:39 +0400, dmitry pervushin wrote:
> > UBI volume notifications is intended to create the API to get clients
> > notified about volume creation/deletion, renaming and changing(actually,
> > resizing). A client can subscribe to these notifications using
> > ubi_volume_register and cancel the subsription using
> > ubi_volume_unregister. When UBI volume change occurs, the atomic
> > notifier will be called. Client also can request "added" event on all
> > volumes that existed before client subscribed to the notifications.
> > 
> > Using notifications instead of calling functions ubi_gluebi_xxx allows
> > MTD emulation layer to be more flexible; say, now is it possible to
> > build it as a module and load/unload it on demand.
> > 
> > Thanks Artem Bityutskiy for reviewing the patch and many very valuable
> > comments.
> > 
> > Signed-off-by: dmitry pervushin <dpervushin@embeddedalley.com>
> 
> Hi,
> 
> thanks for the patch. Is it possible to submit it together
> with a user? E.g., AFAIR you separated out gluebi, could
> this be also submitted? I would be much happier to see a
> new interface functions + a user, not just the interface
> functions alone.
> 
> I've inlined a slightly midified version of your patch
> for you, because I found it easier to fix minor things
> rather than request you about this.
[skipped]
