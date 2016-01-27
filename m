Received: from mail-bn1on0074.outbound.protection.outlook.com ([157.56.110.74]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOScI-00005G-1j
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 16:06:49 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "sztomi89@gmail.com" <sztomi89@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 deadlock
Date: Wed, 27 Jan 2016 16:05:35 +0000
Message-ID: <1453910781.20662.35.camel@infinera.com>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
In-Reply-To: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <51B51A68F09DFC4C9396A7561FD3B46C@infinera.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-01-27 at 16:36 +0100, Szab=F3 Tam=E1s wrote:
> Hello all,
>=20
> I work on an embedded system running Linux 3.10 and found a deadlock
> situation between jffs2_readpage and jffs2_write.
> The problem is present on the latest 4.4 kernel too and occurs when
> two tasks want to access the same file, one reads and the other writes it=
.
>=20
> The kernel stack traces for writer and reader in deadlock:
>=20
> __switch_to+0x4c/0x98
> sleep_on_page+0x10/0x24
> __lock_page+0x8c/0x9c
> find_lock_page+0x7c/0x94
> grab_cache_page_write_begin+0x64/0xd8
> jffs2_write_begin+0x6c/0x2ec
> generic_file_buffered_write+0x188/0x258
> __generic_file_aio_write+0x1e0/0x484
> generic_file_aio_write+0x70/0xfc
> do_sync_write+0x7c/0xd4
> vfs_write+0xc8/0x1b0
> SyS_write+0x4c/0xa8
> ret_from_syscall+0x0/0x38
>=20
> __switch_to+0x4c/0x98
> jffs2_readpage+0x28/0x5c
> generic_file_aio_read+0x22c/0x7a0
> do_sync_read+0x7c/0xd4
> vfs_read+0xb0/0x170
> SyS_read+0x4c/0xa8
> ret_from_syscall+0x0/0x38
>=20
> The root cause here is the locking order of f->sem mutex and pagelock.
> jffs2_readpage function gets the page in locked state and then locks
> the f->sem mutex, while jffs2_write_begin does it in reverse order.
>=20
> I found a commit that brought in this bug.
> That was a fix for another deadlock issue:
> https://github.com/torvalds/linux/commit/5ffd3412ae5536a4c57469cb8ea31887=
121dcb2e
>=20
> According to this commit and my code inspections the lock orders may be
> the following:
> readpage: page lock, f->sem
> writepage_begin: f->sem, page lock
> writepage_end: page lock, f->sem
> GC: f->sem, page lock

I am not sure if this is the first time I hear this or if someone else has =
reported
a similar issue. Based on you observations above you could revert the refer=
enced commit
and fix the locking order in GC to be=A0page lock, f->sem. Does that seem d=
oable?

=A0Jocke
