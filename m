Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LziXz-00050w-DJ
	for linux-mtd@lists.infradead.org; Fri, 01 May 2009 02:32:26 +0000
Received: by yw-out-1718.google.com with SMTP id 9so1498357ywk.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Apr 2009 19:32:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1c3f4270904271930l796c2fber9fb234efa6239a24@mail.gmail.com>
References: <1c3f4270904181955g28d25ef5nef3cc3001c0d3a06@mail.gmail.com>
	<1240126383.3589.46.camel@macbook.infradead.org>
	<1c3f4270904201127o4c0eea30pb17a1a775a7b5d0d@mail.gmail.com>
	<1240305332.4008.91.camel@macbook.infradead.org>
	<1c3f4270904271930l796c2fber9fb234efa6239a24@mail.gmail.com>
Date: Thu, 30 Apr 2009 19:32:17 -0700
Message-ID: <1c3f4270904301932i35990d27o98159c47ff6e9338@mail.gmail.com>
Subject: Re: jffs2 filesystem/flash data integrity
From: Manoj <manoj23@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,
The problem exists after enabling jffs2 debug. I do have a capture of
dmesg output. How do you want me to send the file? It is 78K in size.
Can I attach and send it to your personal account? I don't have a ftp
server to upload it to.

Thanks.

On Mon, Apr 27, 2009 at 7:30 PM, Manoj <manoj23@gmail.com> wrote:
> Hi David,
>
> When I set 'CONFIG_JFFS2_FS_DEBUG=3D1', the problem goes away :-(. =A0Wit=
h
> that flag set to 0, I occasionally see
> "JFFS2 notice: (133) jffs2_get_inode_nodes: Node header CRC failed at
> xxxx" messages. Should I worry about it?
>
> When I make a copy of the file, does it get written to the flash right
> away or does the write happen later? I am doing a "sync" after the
> "cp" command. An interesting thing to note is that the 0s can appear
> in both original and the copied file.
>
> As a separate test, I write 3MB of data and read it back with
> mtd_debug utility; the compare passes.
>
> Thanks.
>
>
> On Tue, Apr 21, 2009 at 2:15 AM, David Woodhouse <dwmw2@infradead.org> wr=
ote:
>> On Mon, 2009-04-20 at 11:27 -0700, Manoj wrote:
>>> How do you want me to give the image that's on the flash? It is in
>>> megabytes. Or do you want me to give the output of jffs2dump for the
>>> image?
>>
>> The output of jffs2dump might be sufficient, but the image itself is
>> probably best, if you can. Stick it on a web/ftp site somewhere?
>>
>> --
>> dwmw2
>>
>>
>
