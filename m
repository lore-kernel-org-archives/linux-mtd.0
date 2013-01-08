Received: from intranet.asianux.com ([58.214.24.6])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TsOVq-0007hx-SP
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2013 02:02:00 +0000
Message-ID: <50EB7E44.1040707@asianux.com>
Date: Tue, 08 Jan 2013 10:02:44 +0800
From: Chen Gang <gang.chen@asianux.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3] fs/ext*,f2fs,jffs2,reiserfs: give comments for acl
 size and count calculation
References: <50DD20B2.6040204@asianux.com> <50E646BC.2090201@asianux.com>
 <50E64A4E.7010408@asianux.com> <50E64BFD.6090000@asianux.com>
 <20130107192016.GD13659@quack.suse.cz>
In-Reply-To: <20130107192016.GD13659@quack.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Theodore Ts'o <tytso@mit.edu>, dwmw2@infradead.org,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, linux-mtd@lists.infradead.org,
 jaegeuk.kim@samsung.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 torvalds@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年01月08日 03:20, Jan Kara 写道:
> On Fri 04-01-13 11:26:53, Chen Gang wrote:
>> > 
>> >   give comments (by Theodore Ts'o)
>> > 
>> >     ACL_USER_OBJ ACL_USER*[1] ACL_GROUP_OBJ ACL_GROUP*[1] ACL_MASK[2] ACL_OTHER
>> > 
>> >     [1] Where * is the regexp sense of "0 or more times"
>> >     [2] Only if there is at least one ACL_USER or ACL_GROUP tag;
>> >         otherwise skip ACL_MASK.
>   Note that I actually updated the entry [2] to be more precise in my
> suggested comment. I wrote:
> [2] If ACL_USER or ACL_GROUP is present, then ACL_MASK must be present.
> 
>   Please use this formulation because the old version suggests ACL_MASK
> cannot be present if neither ACL_USER nor ACL_GROUP are present and that's
> not true. Otherwise your patch looks fine. Thanks!

  according to the implementation of posix_acl_valid (contents at bottom).
    new comments are more precise to match the implementation.
    it means:
      if new comments was incorrect, the implementation would be incorrect.
  welcome another members (especially Theodore Ts'o) to giving confirmation or completion. 

  I should wait 2 days, before send patch v4 with new comments.
    no additional reply within 2 days, means new comments is correct.


  Regards

gchen.


 76 int
 77 posix_acl_valid(const struct posix_acl *acl)
 78 {
 79         const struct posix_acl_entry *pa, *pe;
 80         int state = ACL_USER_OBJ;
 81         kuid_t prev_uid = INVALID_UID;
 82         kgid_t prev_gid = INVALID_GID;
 83         int needs_mask = 0;
 84 
 85         FOREACH_ACL_ENTRY(pa, acl, pe) {
 86                 if (pa->e_perm & ~(ACL_READ|ACL_WRITE|ACL_EXECUTE))
 87                         return -EINVAL;
 88                 switch (pa->e_tag) {
 89                         case ACL_USER_OBJ:
 90                                 if (state == ACL_USER_OBJ) {
 91                                         state = ACL_USER;
 92                                         break;
 93                                 }
 94                                 return -EINVAL;
 95 
 96                         case ACL_USER:
 97                                 if (state != ACL_USER)
 98                                         return -EINVAL;
 99                                 if (!uid_valid(pa->e_uid))
100                                         return -EINVAL;
101                                 if (uid_valid(prev_uid) &&
102                                     uid_lte(pa->e_uid, prev_uid))
103                                         return -EINVAL;
104                                 prev_uid = pa->e_uid;
105                                 needs_mask = 1;
106                                 break;
107 
108                         case ACL_GROUP_OBJ:
109                                 if (state == ACL_USER) {
110                                         state = ACL_GROUP;
111                                         break;
112                                 }
113                                 return -EINVAL;
114 
115                         case ACL_GROUP:
116                                 if (state != ACL_GROUP)
117                                         return -EINVAL;
118                                 if (!gid_valid(pa->e_gid))
119                                         return -EINVAL;
120                                 if (gid_valid(prev_gid) &&
121                                     gid_lte(pa->e_gid, prev_gid))
122                                         return -EINVAL;
123                                 prev_gid = pa->e_gid;
124                                 needs_mask = 1;
125                                 break;
126 
127                         case ACL_MASK:
128                                 if (state != ACL_GROUP)
129                                         return -EINVAL;
130                                 state = ACL_OTHER;
131                                 break;
132 
133                         case ACL_OTHER:
134                                 if (state == ACL_OTHER ||
135                                     (state == ACL_GROUP && !needs_mask)) {
136                                         state = 0;
137                                         break;
138                                 }
139                                 return -EINVAL;
140 
141                         default:
142                                 return -EINVAL;
143                 }
144         }
145         if (state == 0)
146                 return 0;
147         return -EINVAL;
148 }


-- 
Chen Gang

Asianux Corporation
