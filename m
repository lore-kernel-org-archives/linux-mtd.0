Received: from smtp-sh.infomaniak.ch ([128.65.195.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5z6R-0007pc-FI
 for linux-mtd@lists.infradead.org; Sat, 21 Oct 2017 19:06:38 +0000
From: nicolas@belouin.fr
Message-Id: <201710211904.v9LJ4o1X046943@smtp5.infomaniak.ch>
Date: Sat, 21 Oct 2017 21:04:48 +0200
In-Reply-To: <d3e1c911-138d-082a-b941-651217d0faf8@schaufler-ca.com>
References: <20171021134558.21195-1-nicolas@belouin.fr>
 <d3e1c911-138d-082a-b941-651217d0faf8@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [kernel-hardening] [RFC PATCH 1/2] security,
 capabilities: create CAP_TRUSTED
To: Casey Schaufler <casey@schaufler-ca.com>, Jan Kara <jack@suse.com>,
 "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dave Kleikamp <shaggy@kernel.org>, Mark Fasheh <mfasheh@versity.com>,
 Joel Becker <jlbec@evilplan.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <sds@tycho.nsa.gov>,
 Eric Paris <eparis@parisplace.org>, James.Morris@smtp5.infomaniak.ch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

<james.l.morris@oracle.com>,linux-ext4@vger.kernel.org,linux-kernel@vger.kernel.org,linux-f2fs-devel@lists.sourceforge.net,linux-fsdevel@vger.kernel.org,linux-mtd@lists.infradead.org,jfs-discussion@lists.sourceforge.net,ocfs2-devel@oss.oracle.com,linux-unionfs@vger.kernel.org,reiserfs-devel@vger.kernel.org,linux-security-module@vger.kernel.org,selinux@tycho.nsa.gov,linux-api@vger.kernel.org,kernel-hardening@lists.openwall.com
From: Nicolas Belouin <nicolas@belouin.fr>
Message-ID: <E5A1BDA4-A309-4118-84D5-72780F619EBA@belouin.fr>



On October 21, 2017 7:25:21 PM GMT+02:00, Casey Schaufler <casey@schaufler=
-ca=2Ecom> wrote:
>On 10/21/2017 6:45 AM, Nicolas Belouin wrote:
>> with CAP_SYS_ADMIN being bloated, the usefulness of using it to
>> flag a process to be entrusted for e=2Eg reading and writing trusted
>> xattr is near zero=2E
>> CAP_TRUSTED aims to provide userland with a way to mark a process as
>> entrusted to do specific (not specially admin-centered) actions=2E It
>> would for example allow a process to red/write the trusted xattrs=2E
>
>Please explain how this is different from CAP_MAC_ADMIN in
>any existing use case=2E If it is significantly different, how
>would the two interact?

From=20my point of view, CAP_MAC_ADMIN allows one to read/write security xat=
trs, those are meant to describe security policies=2E As far as I know of, =
trusted xattrs are intended for a privileged process to read or write arbit=
rary data=2E I don't have any real world example in mind that use trusted x=
attrs, but I'll try to find one=2E

>
>> Signed-off-by: Nicolas Belouin <nicolas@belouin=2Efr>
>> ---
>>  include/uapi/linux/capability=2Eh     | 6 +++++-
>>  security/selinux/include/classmap=2Eh | 5 +++--
>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/uapi/linux/capability=2Eh
>b/include/uapi/linux/capability=2Eh
>> index ce230aa6d928=2E=2E27e457b93c84 100644
>> --- a/include/uapi/linux/capability=2Eh
>> +++ b/include/uapi/linux/capability=2Eh
>> @@ -369,7 +369,11 @@ struct vfs_ns_cap_data {
>> =20
>>  #define CAP_SYS_MOUNT		38
>> =20
>> -#define CAP_LAST_CAP         CAP_SYS_MOUNT
>> +/* Allow read/write trusted xattr */
>> +
>> +#define CAP_TRUSTED		39
>> +
>> +#define CAP_LAST_CAP         CAP_TRUSTED
>> =20
>>  #define cap_valid(x) ((x) >=3D 0 && (x) <=3D CAP_LAST_CAP)
>> =20
>> diff --git a/security/selinux/include/classmap=2Eh
>b/security/selinux/include/classmap=2Eh
>> index a873dce97fd5=2E=2Ef5dc8e109f5a 100644
>> --- a/security/selinux/include/classmap=2Eh
>> +++ b/security/selinux/include/classmap=2Eh
>> @@ -24,9 +24,10 @@
>>  	    "audit_control", "setfcap"
>> =20
>>  #define COMMON_CAP2_PERMS  "mac_override", "mac_admin", "syslog", \
>> -		"wake_alarm", "block_suspend", "audit_read", "sys_mount"
>> +		"wake_alarm", "block_suspend", "audit_read", "sys_mount", \
>> +		"trusted"
>> =20
>> -#if CAP_LAST_CAP > CAP_SYS_MOUNT
>> +#if CAP_LAST_CAP > CAP_TRUSTED
>>  #error New capability defined, please update COMMON_CAP2_PERMS=2E
>>  #endif
>> =20

Nicolas
