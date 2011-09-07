Received: from mail-gw0-f48.google.com ([74.125.83.48])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1LxI-0007GF-VD
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 17:30:34 +0000
Received: by gwj22 with SMTP id 22so5751688gwj.21
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Sep 2011 10:30:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110907065621.GL32018@logfs.org>
References: <CAMjNe_fdRw=5-MjOii8aGfEvejPo-dR6Rpf1=JQf_gMJ3U9jfQ@mail.gmail.com>
	<20110907065621.GL32018@logfs.org>
Date: Wed, 7 Sep 2011 23:00:30 +0530
Message-ID: <CAMjNe_fd8S08SG45kOASDkUFPMuT0WoOHZ1cGnTqk5pKj7DxgA@mail.gmail.com>
Subject: Re: logfs: max 4K writepage size
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 7, 2011 at 12:26 PM, J=F6rn Engel <joern@logfs.org> wrote:
>
>> Can you suggest what changes have to be done to have >4K writepage size.
>
> I think the only change strictly necessary is the patch below,
> removing an assertion. =A0Plus the second patch below for mklogfs.
>

Thanks for the patches.
I was able to do  basic mount-copy-unmount once.
 Let me test more with multiple mount unmount cycles and see if there
are problems.
I think we have to give mklogfs /dev/mtdblock0 instead of /dev/mtd0
I updated wikipedia with steps to use logfs
http://en.wikipedia.org/wiki/LogFS
thanks,
mugunthan
