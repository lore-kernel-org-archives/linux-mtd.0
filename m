Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyl6f-0000Ve-IE
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 18:35:54 +0000
Received: by iouu10 with SMTP id u10so28533308iou.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 10:35:32 -0800 (PST)
Date: Tue, 17 Nov 2015 12:34:44 -0600
From: Seth Forshee <seth.forshee@canonical.com>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v3 0/7] User namespace mount updates
Message-ID: <20151117183444.GB108807@ubuntu-hedt>
References: <1447778351-118699-1-git-send-email-seth.forshee@canonical.com>
 <20151117170556.GV22011@ZenIV.linux.org.uk>
 <20151117172551.GA108807@ubuntu-hedt>
 <20151117175506.GW22011@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151117175506.GW22011@ZenIV.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 05:55:06PM +0000, Al Viro wrote:
> On Tue, Nov 17, 2015 at 11:25:51AM -0600, Seth Forshee wrote:
> 
> > Shortly after that I plan to follow with support for ext4. I've been
> > fuzzing ext4 for a while now and it has held up well, and I'm currently
> > working on hand-crafted attacks. Ted has commented privately (to others,
> > not to me personally) that he will fix bugs for such attacks, though I
> > haven't seen any public comments to that effect.
> 
> _Static_ attacks, or change-image-under-mounted-fs attacks?

Right now only static attacks, change-image-under-mounted-fs attacks
will be next.
