Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rw6uB-00058U-9M
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2012 06:57:55 +0000
Received: by ggnf2 with SMTP id f2so2029774ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2012 22:57:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.02.1202082104470.2794@ionos>
References: <D61182AC8012EA4EBC531B3AF23BE109B3C6C6@tranzeo-mail2.12stewart.tranzeo.com>
 <alpine.LFD.2.02.1202082104470.2794@ionos>
Date: Fri, 10 Feb 2012 22:57:54 -0800
Message-ID: <CAN8TOE8xLdawRm9i6oTXJOE5T+MUEinkQysH9_ossikdW+8ZhA@mail.gmail.com>
Subject: Re: jffs2 filesystem: possible circular locking dependency detected
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-rt-users <linux-rt-users@vger.kernel.org>,
 Darcy Watkins <DWatkins@tranzeo.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-mtd@lists.infradead.org, Josh Cartwright <joshc@linux.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 8, 2012 at 12:09 PM, Thomas Gleixner <tglx@linutronix.de> wrote=
:
> On Wed, 8 Feb 2012, Darcy Watkins wrote:
>> [ =A0 20.932000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [ =A0 20.932000] [ INFO: possible circular locking dependency detected ]
>> [ =A0 20.932000] 3.0.18-rt34 #41
>> [ =A0 20.932000] -------------------------------------------------------
>> [ =A0 20.932000] depmod/734 is trying to acquire lock:
>> [ =A0 20.932000] =A0(&mm->mmap_sem){++++++}, at: [<800e82d0>] might_faul=
t+0x4c/0xa4
>> [ =A0 20.932000]
>> [ =A0 20.932000] but task is already holding lock:
>> [ =A0 20.932000] =A0(&f->sem){+.+.+.}, at: [<80184f88>] jffs2_readdir+0x=
108/0x1c0
>> [ =A0 20.932000]
>> [ =A0 20.932000] which lock already depends on the new lock.
>
> Classic ABBA deadlock. I don't think it's RT specific, but I might be
> wrong as usual. Will have a look later this week, when noone beats me.

Looks like someone beat you :) Josh Cartwright has a patch here:
http://lists.infradead.org/pipermail/linux-mtd/2012-February/039787.html

Testing is always helpful to the MTD maintainers!

Brian
