Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vv8qU-0003d8-Ji
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2013 16:59:10 +0000
From: Chris Mason <clm@fb.com>
To: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH 00/21] Consolidate Posix ACL implementation V3
Date: Mon, 23 Dec 2013 16:57:58 +0000
Message-ID: <1387817904.8080.4.camel@ret.masoncoding.com>
References: <20131220131635.650823732@bombadil.infradead.org>
In-Reply-To: <20131220131635.650823732@bombadil.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-7"
Content-ID: <55F48838A946C644AC50A45C770BFE71@fb.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "andreas.gruenbacher@linbit.com" <andreas.gruenbacher@linbit.com>,
 "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "mfasheh@suse.com" <mfasheh@suse.com>,
 "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-12-20 at 05:16 -0800, Christoph Hellwig wrote:
+AD4- This series consolidates the various cut'n'pasted Posix ACL implement=
ations
+AD4- into a single common one based on the -+AD4-get+AF8-acl method Linus =
added a while
+AD4- ago and a new -+AD4-set+AF8-acl counterpart.
+AD4-=20
+AD4- This remove +AH4-1800 lines of code and provides a single place to im=
plement
+AD4- various nasty little gems of the semantics.

Is this in a git tree somewhere?  I'll pull in and test the btrfs bits.

-chris
