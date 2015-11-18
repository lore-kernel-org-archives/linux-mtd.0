Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz4Qt-0006C6-CL
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 15:14:05 +0000
Date: Wed, 18 Nov 2015 15:13:35 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Austin S Hemmelgarn <ahferroin7@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v3 0/7] User namespace mount updates
Message-ID: <20151118151335.GD22011@ZenIV.linux.org.uk>
References: <20151117172551.GA108807@ubuntu-hedt>
 <20151117175506.GW22011@ZenIV.linux.org.uk>
 <564B79B1.3040207@gmail.com> <20151117191606.GC108807@ubuntu-hedt>
 <564B941A.2070601@gmail.com> <20151117213255.GE108807@ubuntu-hedt>
 <564C6DD4.6090308@gmail.com> <20151118142238.GB134139@ubuntu-hedt>
 <20151118145818.GC22011@ZenIV.linux.org.uk>
 <20151118150512.GE134139@ubuntu-hedt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151118150512.GE134139@ubuntu-hedt>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 18, 2015 at 09:05:12AM -0600, Seth Forshee wrote:

> Yes, the host admin. I'm not talking about trusting the admin inside the
> container at all.

Then why not have the same host admin just plain mount it when setting the
container up and be done with that?  From the host namespace, before spawning
the docker instance or whatever framework you are using.  IDGI...
