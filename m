Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJW6h-00061E-Nz
	for linux-mtd@lists.infradead.org; Sun, 25 Sep 2005 08:59:56 -0400
Date: Sun, 25 Sep 2005 14:59:52 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Lior Balkohen <balkohen@gmail.com>
Message-ID: <20050925125952.GB28978@wohnheim.fh-wedel.de>
References: <196b7d310509201437bd93c27@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <196b7d310509201437bd93c27@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: kernel panic with block2mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 September 2005 23:37:31 +0200, Lior Balkohen wrote:
> 
> after patching my kernel with today's mtd cvs,
> 
> [...]
>
> Modules linked in: jffs2 zlib_deflate block2mtd mtdcore snd_pcm_oss
> snd_mixer_oss snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq
> snd_via82xx snd_ac97_codec snd_pcm snd_timer snd_page_alloc
> snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore nvidia
> CPU:    0
> EIP:    0060:[<e0bdacf8>]    Tainted: P      VLI
>
> [...]
> 
> what's going on?

Hard to say.  Are you able to reproduce this with a plain 2.6.13
kernel without the nvidia module loaded?  And if yes, can you send me
your kernel config?

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
