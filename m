Subject: Re: JFFS2 problem with filename length > 7
From: David Woodhouse <dwmw2@infradead.org>
To: Martin Wedepohl <martinatgd@gmail.com>
In-Reply-To: <67f0a57c0609281100y6b049febo69340c157b858ea4@mail.gmail.com>
References: <67f0a57c0609262213j56993210h654450841dcac92f@mail.gmail.com>
	<1159337564.3309.91.camel@pmac.infradead.org>
	<67f0a57c0609271418q61d32478jff09b9a15d29e4be@mail.gmail.com>
	<1159392902.3309.159.camel@pmac.infradead.org>
	<67f0a57c0609281100y6b049febo69340c157b858ea4@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 28 Sep 2006 21:26:37 +0100
Message-Id: <1159475197.3309.336.camel@pmac.infradead.org>
Mime-Version: 1.0
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

On Thu, 2006-09-28 at 12:00 -0600, Martin Wedepohl wrote:
> JFFS2 error: (872) read_direntry: already:  0: read:  9: rd->nsize:  9:
>             ref_offset(ref): 0x00000600: fd->name: 9999
> JFFS2 error: (872) read_direntry: already:  0: read:  8: rd->nsize:  8:
>             ref_offset(ref): 0x00000548: fd->name: 8888 

Ok, it already seems truncated by this point -- but can you hexdump the
buffer which was actually read from the flash?

-- 
dwmw2
