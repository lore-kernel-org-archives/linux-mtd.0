From: David Woodhouse <dwmw2@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050323T212715-407@post.gmane.org>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com>  <loom.20050323T212715-407@post.gmane.org>
Content-Type: text/plain
Date: Thu, 24 Mar 2005 21:59:53 +0000
Message-Id: <1111701594.6588.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-03-23 at 20:50 +0000, Sergei Sharonov wrote:
> I believe I saw a proposal to save small chunks as separate files,
> then append them as a temp file and rename temp file to real log
> file. 
> The problems are (1) the log file is huge (2) rename is not atomic per
> your reply.

The important part of rename is atomic. If you have 'log_file', and then
you create 'log_file.new' and rename that to 'log_file', then there is
never an instant where 'log_file' does not exist; it goes directly from
pointing to one inode, to pointing to the other.

-- 
dwmw2
