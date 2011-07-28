Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmW2w-0007bN-SY
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2011 19:15:04 +0000
Received: by vws8 with SMTP id 8so2499722vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Jul 2011 12:14:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E3131AE.7010408@free-electrons.com>
References: <4E3131AE.7010408@free-electrons.com>
Date: Thu, 28 Jul 2011 21:14:58 +0200
Message-ID: <CAAfyv35zgDLpf6Hs0G0wESh0-BjoiWMH+4wA7+anSwR0rREtbA@mail.gmail.com>
Subject: Re: Flash filesystems benchmarks
From: Belisko Marek <marek.belisko@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	tim.bird@am.sony.com, Linux Embedded <linux-embedded@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Jul 28, 2011 at 11:53 AM, David Wagner
<david.wagner@free-electrons.com> wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Hello,
>
> As a contract with the CELF, we (Free Electrons) developed a flash
> filesystem benchmarking suite ; it tests ubifs, jffs2, yaffs2 and
> squashfs(over UBI+two different block transition layers). It has been
> run on a Calao USB-9263 board and a IGEPv2 board and on 2.6.38, .39 and
> 3.0 kernels.
>
> The results are shown as histograms and two different reportings exists:
> =C2=A0* filesystem comparison for a given board/kernel couple
> =C2=A0* kernel comparison for a given board/filesystem couple
>
> All the details are to be found at:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://elinux.org/Flash_Filesystem_Benchmarks
> Direct link to the test protocol:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://elinux.org/Flash_Filesystem_Benchmarks_=
Protocol
> Link to the gitorious page:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0https://gitorious.org/ffs-benchmarks/ffs-bench=
marks
>
> Reviews of the test protocol, pointers to incoherent results or any
> other comment is welcome.
> We will keep posting more results.
Great job ;). Maybe small README how to use scripts. I try to run
./performance-test.py but got en error because test.cfg doesn't exist.
Shouldn't there be input argument for specific board something like:
diff --git a/performance-tests.py b/performance-tests.py
index 78c83f0..33a4292 100755
--- a/performance-tests.py
+++ b/performance-tests.py
@@ -168,7 +168,12 @@ def main():
        global cur

        cfg =3D ConfigParser.ConfigParser()
-       cfg.read('test.cfg')
+
+       if (len(sys.argv) < 2):
+           print "board configuration parameter missing!!!"
+           return
+
+       cfg.read(sys.argv[1])

        board_name =3D cfg.defaults()['board_name']
        version =3D cfg.defaults()['version']


>
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0David Wagner
>
> --
> David Wagner, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.html
>

thanks,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
