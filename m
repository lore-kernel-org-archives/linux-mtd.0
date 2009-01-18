Received: from mail-bw0-f17.google.com ([209.85.218.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LObNl-0003cb-AU
	for linux-mtd@lists.infradead.org; Sun, 18 Jan 2009 17:24:37 +0000
Received: by bwz10 with SMTP id 10so24963bwz.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jan 2009 09:24:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
References: <200901071022.46343.corentincj@iksaif.net>
	<alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
Date: Sun, 18 Jan 2009 18:24:11 +0100
Message-ID: <71cd59b00901180924t4b61a22cw325b18789dd953b2@mail.gmail.com>
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
From: Corentin Chary <corentin.chary@gmail.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 18, 2009 at 3:47 PM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
>
>
> On Wed, 7 Jan 2009, Corentin Chary wrote:
>
>> Hi,x
>> These are three patch to make a usespace program able to use map/unmap
>> operation and to query if a LEB is mapped.
>> We are trying to do an UBI based userspace filesystem (using fuse) and we
>> needed these, but it could also be used for testing purpose.
>> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.
>
> Hi,
>
> I'm not sure whether you'll ever implement your user-space stuff
> or not, but I was thinking that it is probably bad to make your
> life difficult by requireing this CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
> option.
>
> I suggest you to add yet another ioctl which enables/disables direct
> user-space writes. And make them disabled by default. Then you may
> remove the CONFIG_MTD_UBI_DEBUG_USERSPACE_IO option. Your FS will
> only need to enable the volume direct I/O before it starts writing
> anything.
>
> Artem.

Hi,
Indeed I think it's the way to go. We'll send a patch ASAP.

Thanks for your advice

-- 
Corentin Chary
http://xf.iksaif.net
