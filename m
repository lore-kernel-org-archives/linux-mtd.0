Date: Sun, 18 Jan 2009 14:47:19 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
In-Reply-To: <200901071022.46343.corentincj@iksaif.net>
Message-ID: <alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
References: <200901071022.46343.corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Wed, 7 Jan 2009, Corentin Chary wrote:

> Hi,x
> These are three patch to make a usespace program able to use map/unmap
> operation and to query if a LEB is mapped.
> We are trying to do an UBI based userspace filesystem (using fuse) and we
> needed these, but it could also be used for testing purpose.
> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.

Hi,

I'm not sure whether you'll ever implement your user-space stuff
or not, but I was thinking that it is probably bad to make your
life difficult by requireing this CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
option.

I suggest you to add yet another ioctl which enables/disables direct
user-space writes. And make them disabled by default. Then you may
remove the CONFIG_MTD_UBI_DEBUG_USERSPACE_IO option. Your FS will
only need to enable the volume direct I/O before it starts writing
anything.

Artem.
