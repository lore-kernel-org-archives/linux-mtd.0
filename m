Received: from mail-px0-f171.google.com ([209.85.212.171])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9RS1-0003eJ-0g
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 00:27:26 +0000
Received: by pxi7 with SMTP id 7so3038453pxi.16
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 17:27:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=_MuYjivsa_Ja+g4t7VKrk0VjdZw@mail.gmail.com>
References: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
	<BANLkTi=_MuYjivsa_Ja+g4t7VKrk0VjdZw@mail.gmail.com>
Date: Mon, 11 Apr 2011 17:27:22 -0700
Message-ID: <BANLkTikGwYfQdh6TSej-wq9MOxBobHLpPQ@mail.gmail.com>
Subject: Re: [PATCH] Fix gcc-4.5.2 "statement with no effect" warnings in UBIFS
From: Russ Dill <russ.dill@gmail.com>
To: maksim.rayskiy@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 11, 2011 at 5:12 PM, Russ Dill <russ.dill@gmail.com> wrote:
> On Mon, Apr 11, 2011 at 2:50 PM, =C2=A0<maksim.rayskiy@gmail.com> wrote:
>> From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
>>
>> When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
>> gcc-4.5.2 generates a slew of "warning: statement with no effect"
>> on references to non-void functions defined as 0.
>> To avoid these warnings, change appropriate definitions from
>> =C2=A0#define dbg_xxx(a) =C2=A0 =C2=A0 0
>> to
>> =C2=A0#define dbg_xxx(a) =C2=A0 =C2=A0 ({0; })
>>
>> Signed-off-by: Maksim Rayskiy <maksim.rayskiy@gmail.com>
>> ---
>> =C2=A0fs/ubifs/debug.h | =C2=A0 50 +++++++++++++++++++++++++------------=
-------------
>> =C2=A01 files changed, 25 insertions(+), 25 deletions(-)
>>
>> diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
>> index 919f0de..e30a629 100644
>> --- a/fs/ubifs/debug.h
>> +++ b/fs/ubifs/debug.h
>> @@ -425,34 +425,34 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
>> =C2=A0#define dbg_dump_index(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({})
>> =C2=A0#define dbg_dump_lpt_lebs(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ({})
>>
>> -#define dbg_walk_index(c, leaf_cb, znode_cb, priv) 0
>> -#define dbg_old_index_check_init(c, zroot) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0
>> +#define dbg_walk_index(c, leaf_cb, znode_cb, priv) ({0; })
>> +#define dbg_old_index_check_init(c, zroot) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
({0; })
>> =C2=A0#define dbg_save_space_info(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({})
>> -#define dbg_check_space_info(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_check_old_index(c, zroot) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00
>> -#define dbg_check_cats(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_check_ltab(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_chk_lpt_free_spc(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_chk_lpt_sz(c, action, len) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0
>> -#define dbg_check_synced_i_size(inode) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0
>> -#define dbg_check_dir_size(c, dir) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0
>> -#define dbg_check_tnc(c, x) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_check_idx_size(c, idx_size) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00
>> -#define dbg_check_filesystem(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> +#define dbg_check_space_info(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_check_old_index(c, zroot) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_check_cats(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_check_ltab(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_chk_lpt_free_spc(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_chk_lpt_sz(c, action, len) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ({0; })
>> +#define dbg_check_synced_i_size(inode) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ({0; })
>> +#define dbg_check_dir_size(c, dir) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ({0; })
>> +#define dbg_check_tnc(c, x) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_check_idx_size(c, idx_size) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0({0; })
>> +#define dbg_check_filesystem(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> =C2=A0#define dbg_check_heap(c, heap, cat, add_pos) =C2=A0 =C2=A0 =C2=A0=
({})
>> -#define dbg_check_lprops(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_check_lpt_nodes(c, cnode, row, col) =C2=A0 =C2=A00
>> -#define dbg_check_inode_size(c, inode, size) =C2=A0 =C2=A0 =C2=A0 0
>> -#define dbg_check_data_nodes_order(c, head) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0
>> -#define dbg_check_nondata_nodes_order(c, head) =C2=A0 =C2=A0 0
>> -#define dbg_force_in_the_gaps_enabled =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00
>> -#define dbg_force_in_the_gaps() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>> -#define dbg_failure_mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>> -
>> -#define dbg_debugfs_init() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>> +#define dbg_check_lprops(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_check_lpt_nodes(c, cnode, row, col) =C2=A0 =C2=A0({0; })
>> +#define dbg_check_inode_size(c, inode, size) =C2=A0 =C2=A0 =C2=A0 ({0; =
})
>> +#define dbg_check_data_nodes_order(c, head) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
({0; })
>> +#define dbg_check_nondata_nodes_order(c, head) =C2=A0 =C2=A0 ({0; })
>> +#define dbg_force_in_the_gaps_enabled =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_force_in_the_gaps() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({0; })
>> +#define dbg_failure_mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({0; })
>> +
>> +#define dbg_debugfs_init() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({0; })
>> =C2=A0#define dbg_debugfs_exit()
>> -#define dbg_debugfs_init_fs(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>> -#define dbg_debugfs_exit_fs(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>> +#define dbg_debugfs_init_fs(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({0; })
>> +#define dbg_debugfs_exit_fs(c) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({0; })
>>
>> =C2=A0#endif /* !CONFIG_UBIFS_FS_DEBUG */
>> =C2=A0#endif /* !__UBIFS_DEBUG_H__ */
>> --
>> 1.7.1
>>
>
> Should these all just be:
>
> =C2=A0do {} while(0)

never-mind, I see while the ({0;}) format is preferable.

> Stuff like:
>
> #define dbg_debugfs_exit()
>
> looks particularly dangerous.

but this still stands
